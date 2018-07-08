@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row" >
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Персональная страница</div>

                <div class="panel-body pp-block">
					<br>
					<a class="btn btn-primary btn-block btn-p" href="{{ url('/add_words') }}">
						ПОПОЛНИТЬ СЛОВАРЬ
					</a>
					<br><br>
					<a class="btn btn-primary btn-block btn-p" href="{{ url('/users_words') }}">
						МОЙ СЛОВАРЬ
					</a>
					<br><br>
					<a class="btn btn-primary btn-block btn-p" href="{{ url('/repeat_words') }}">
						ПОВТОРИТЬ СЛОВА
					</a>
					<br><br>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
