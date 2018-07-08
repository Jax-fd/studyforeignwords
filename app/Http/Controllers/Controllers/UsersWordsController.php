<?php

namespace App\Http\Controllers\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Word;
use App\User;
use Auth;
use DB;

class UsersWordsController extends Controller
{
    public function ShowWords(Request $request){
		$user_id = Auth::user()->id; //получаем id текущего пользователя
		$user_words = DB::table('users_words')->where('user_id', '=', $user_id)->where('status','=',2)->orderBy('date_of_repeat')->get();
		
		foreach ($user_words as &$word) {
			$word_tmp = DB::table('words')->where('id','=',$word->word_id)->get();
			$word->word = $word_tmp[0]->word;
			$word->transcription = $word_tmp[0]->transcription;
			$word->translation = $word_tmp[0]->translation;
			$word->date_of_repeat = date('d-m-Y',strtotime($word->date_of_repeat));
			$word->created_at = date('d-m-Y',strtotime($word->created_at));
		}
		unset($word);
		//dump($user_words);
		
		if(view()->exists('userswords')){
			return view('userswords')->with(['user_words' => $user_words]);
		}
		abort(404);
		
	}
	
}
