<?php

namespace App\Http\Controllers\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use DB;
use App\Word;
use App\User;
use Auth;

class AddWordsController extends Controller
{

//Вывод формы слова, поля для ответа и доп.инфы
    public function ShowWord(Request $request){
		$user = Auth::user();
		$user_id = Auth::user()->id; //получаем id текущего пользователя
		
		//вытягиване данных для вывода предыдущего реза
		$prev_id = $request->session()->pull('prev_id', -1);
		$prev_res = $request->session()->pull('prev_res');
		$prev_ans = $request->session()->pull('prev_ans');
		if(empty($prev_ans)){$prev_ans='[пустой ответ]';};
		$mes_prev="";
		if($prev_id != -1){
			$prev_word = Word::where('id','=',$prev_id)->get(['word','transcription','translation'])->first();;			
			$mes_prev = "Предыдущий ответ: <br>" . $prev_word->translation . ' <i class="fa fa-long-arrow-right" aria-hidden="true"></i> ' ;
			if($prev_res == 2){
				$mes_prev .= " <span class=text-danger> <s>" . $prev_ans . "</s> </span>" . $prev_word->word . " " . $prev_word->transcription;
			}else{
				$mes_prev .= " <span class=text-success>" . $prev_word->word . "</span> " . $prev_word->transcription;
			}
		}
		
		//Вытягиваем в массив id всех слов словаря
		//$words = DB::table('words')->pluck('id');
		$words = Word::all()->pluck('id')->toArray();
		$all_words = count($words);	//подсчитываем кол-во
		//Вытягиваем id слов, которые не должны выводиться (отвечены правильно либо добавлены на изучение)
		//$user_words = DB::table('users_words')->where('user_id', '=', $user_id)->where('status','!=',0)->pluck('word_id');
		$user_words = $user->words()->where('status','!=',0)->pluck('word_id')->toArray();
		//Подсчитываем сколько слов пользователь ответил правильно
		$learned_words = $user->words()->where('status','=',1)->count();
		//Подсчитываем сколько слов пользователь добавил на изучение
		$added_words = $user->words()->where('status','=',2)->count();
		
		//очищаем массив всех слов от уже отвеченных или добавленных в словарь
		for($i=0;$i<count($user_words);$i++){
			$key_del = array_search($user_words[$i],$words);
			if(isset($key_del)){
				unset($words[$key_del]); 
				$words=array_values($words);
			}
		}
		//если доступные слова есть, то подсчитываем кол-во и выбираем случайное
		$all_words2= 0 ;
		$word_id = -1;
		if(!empty($words)){
			$all_words2 = count($words);
			$word_id = $words[rand(1,count($words))-1];
		}
		//Находим в базе слово по полученному id и записываем перевод
		$word_tr = Word::find($word_id)->translation;
		//Выводим вид с полученными данными
		if(view()->exists('addwords')){
			return view('addwords')->with([ 'word' => $word_tr,
											'id' => $word_id,
											'all_words' => $all_words,
											'all_words2' => $all_words2,
											'learned_words' => $learned_words,
											'added_words' => $added_words,
											'mes_prev' => $mes_prev
											]);
		}
		abort(404);
	}

//Сохранение слова	
	public function SaveWord(Request $request){
		$word = Word::find($request->input('id'));
		$word_id = $word->id;
		$user = $request->user();
		$user_id = $request->user()->id;
		
		$answer  = strtolower(trim(strip_tags($request->input('answer'))));	//забираем ответ юзера

		//поиск и удаление записей с такими данным (таких не должно быть, но на всякий случай)
		$user->words()->detach($word_id);
		
		//$tw = Word::find(12);
		
		//$t = $user->words(12);//->save($tw);
		//dd($t);
		
		$status=2;			//в словарь пользователя на изучение
		$stage=1;
		$day=date('Y-m-d', strtotime ('+1 day'));
		//Если ответ правильный
		if($answer == $word['word']){
			$status=1;  	//то убрать из общего словаря для этого пользователя
			$stage=0;
			$day=0;
		}
		//записываем в сессию для вывода результатов предыдущего ответа
		$request->session()->put('prev_id', $word_id);
		$request->session()->put('prev_res', $status);
		$request->session()->put('prev_ans', $answer);
		//записываем связь слова и пользователя
		
		$user->words()->attach($word_id,['status'=>$status,
										 'stage'=>$stage,
										 'date_of_repeat'=>$day]);
		//перенаправляем на страницу пополнения словаря
		return redirect('/add_words');
	}
	
	//пока не используется
	public function ShowResult(){
		if(view()->exists('addwords')){
			return view('addwords');
		}
		abort(404);
	}
}
