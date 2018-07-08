<?php

namespace App\Http\Controllers\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class PersonalPageController extends Controller
{
    public function show(Request $request){
	
		if(view()->exists('personalpage')){
			return view('personalpage');
		}
		abort(404);
	}
}
