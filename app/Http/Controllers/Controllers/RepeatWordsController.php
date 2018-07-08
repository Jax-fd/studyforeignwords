<?php

namespace App\Http\Controllers\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use DB;
use App\Word;
use App\User;
use Auth;

class RepeatWordsController extends Controller
{
    //Вывод формы слова, поля для ответа и доп.инфы
    public function ShowWord(Request $request){
		$user_id = Auth::user()->id; //получаем id текущего пользователя
		
		//вытягиване данных для вывода предыдущего реза
		$prev_id = $request->session()->pull('prev_id', -1);
		$prev_res = $request->session()->pull('prev_res');
		$prev_ans = $request->session()->pull('prev_ans');
		if(empty($prev_ans)){$prev_ans='[пустой ответ]';};
		$mes_prev="";
		if($prev_id != -1){
			$prev_word = DB::table('words')->where('id', '=', $prev_id)->get();//->pluck('word','transcription','translation');
			$mes_prev = "Предыдущий ответ: <br>" . $prev_word[0]->translation . ' <i class="fa fa-long-arrow-right" aria-hidden="true"></i> ' ;
			if($prev_res == 0){
				$mes_prev .= " <span class=text-danger> <s>" . $prev_ans . "</s> </span>" . $prev_word[0]->word . " " . $prev_word[0]->transcription;
			}else{
				$mes_prev .= " <span class=text-success>" . $prev_word[0]->word . "</span> " . " " . $prev_word[0]->transcription;
			}
		}
		
		//Вытягиваем id слов, которые не должны выводиться (отвечены правильно либо добавлены на изучение)
		$today = date('Y-m-d');
		$user_words = DB::table('users_words')->where('user_id', '=', $user_id)
											  ->where('status','=',2)
											  ->where('date_of_repeat','<=',$today)
											  ->pluck('word_id');
		$number_of_words = count($user_words);
		//если доступные слова есть, то подсчитываем кол-во и выбираем случайное
		$word_id = -1;
		if(!empty($user_words)){
			$word_id = $user_words[rand(1,count($user_words))-1];
		}
		//Находим в базе слово по полученному id и записываем перевод
		$word_ar = Word::find($word_id);
		$word_tr=$word_ar['translation'];
		//Выводим вид с полученными данными
		if(view()->exists('repeatwords')){
			return view('repeatwords')->with([ 'word' => $word_tr,
											'id' => $word_id,
											'number_of_words' => $number_of_words,
											'mes_prev' => $mes_prev
											]);
		}
		abort(404);
	}
	
	//Сохранение результата	
	public function SaveResult(Request $request){
		$user_id = Auth::user()->id;			//записываем id текущего юзера
		
		//загружаем этапы повторения с интервалами по умолчанию, преобразуем в массив
		$default_stages = DB::table('stages_of_repeat')->find(1);
		$arr_def_st = explode(",",$default_stages->stages);
		//dump($arr_def_st);
		$word_id = $request->input('id');		//забираем id слова
		$answer  = strtolower(trim(strip_tags($request->input('answer'))));	//забираем ответ юзера
		$word_en = Word::find($word_id);		//находим слово в таблице
		
		//получаем stage и date_of_repeat
		$st_before = User::find($user_id)->words()->where('word_id','=',$word_id)->get()->toArray();
		//dump($st_before);
		
		$stage_after = 1;
		$today = date('Y-m-d');
		$next_date = date('Y-m-d', strtotime ('+1 day'));
		$result = 0; //результат ответа
		if($answer == $word_en['word']){
			$result = 1;
		    //увеличиваем этап повторения на 1
			$stage_after = $st_before[0]['pivot']['stage']+1;
			
			//увеличиваем сегодняшнюю дату на интервал в соответствии с этапом
			$next_date = strtotime($today);
			if($st_before[0]['pivot']['stage'] < 10){
				$next_date += $arr_def_st[$st_before[0]['pivot']['stage']-1] * 24*60*60; //увеличиваем ее на кол-во(дней) до след. этапа  * 1 день
			}else{ //на 10м и выше этапе, следующая дата увеличивается одинаково (как на десятом)
				$next_date += $arr_def_st[9] * 24*60*60;
			}
			//преобразуем для записи в бд
			$next_date = date('Y-m-d', $next_date);
		}
		
		//записываем в сессию для вывода результатов предыдущего ответа
		$request->session()->put('prev_id', $word_id);
		$request->session()->put('prev_res', $result);
		$request->session()->put('prev_ans', $answer);
		
		//записываем связь слова и пользователя
		$user = User::find($user_id);
		$word = Word::find($word_id);
		$user->words()->updateExistingPivot($word_id, [	'stage'=>$stage_after,
														'date_of_repeat'=>$next_date]);
		
		//перенаправляем на страницу пополнения словаря
		return redirect('/repeat_words');
	}
	
	//пока не используется
	public function ShowResult(){
		if(view()->exists('addwords')){
			return view('addwords');
		}
		abort(404);
	}
}
