<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/',['as'=>'index', 'uses'=>'Controllers\IndexController@show']);

Route::auth();

Route::get('/about', 'AboutController@index');

Route::get('/personal_page', [ 'as'=>'PersonalPage', 'middleware' => ['auth'], 'uses'=>'Controllers\PersonalPageController@show']);

Route::get('/add_words', [ 'as'=>'AddWords', 'middleware' => ['auth'], 'uses'=>'Controllers\AddWordsController@ShowWord']);
Route::post('/add_words', [ 'as'=>'AddWords', 'uses'=>'Controllers\AddWordsController@SaveWord']);

Route::get('/users_words', [ 'as'=>'UsersWords', 'middleware' => ['auth'], 'uses'=>'Controllers\UsersWordsController@ShowWords']);

Route::get('/repeat_words', [ 'as'=>'RepeatWords', 'middleware' => ['auth'], 'uses'=>'Controllers\RepeatWordsController@ShowWord']);
Route::post('/repeat_words', [ 'as'=>'RepeatWords', 'uses'=>'Controllers\RepeatWordsController@SaveResult']);

//Route::get('/add_words_end', [ 'as'=>'AddWords', 'middleware' => ['auth'], 'uses'=>'Controllers\AddWordsController@ShowResult']);


