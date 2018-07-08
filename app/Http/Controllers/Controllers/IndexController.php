<?php

namespace App\Http\Controllers\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Auth;

class IndexController extends Controller
{
    public function show(){
		if (Auth::guest()){
			if(view()->exists('about')){
				return redirect('/about');
			}
			abort(404);
			
		}else{
			if(view()->exists('personalpage')){
				return redirect('/personal_page');
			}
			abort(404);
		}
	}
}
