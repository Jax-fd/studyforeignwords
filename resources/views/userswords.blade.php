@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Список слов, добавленных на изучение</div>

                <div class="panel-body">
					@if(!empty($user_words))
						<div class="table-responsive"> 
							<table class="table table-condensed">
								<thead>
									<tr>
										<th>№</th>
										<th>Слово</th>
										<th>Транскрипция</th>
										<th >Перевод</th>
										<th style="width: 100px;" >Текущий этап повторения</th>
										<th style="width: 100px;" >Следующая дата повторения</th>
										<th style="width: 100px;" >Дата добавления</th>
										
									</tr>
								</thead>
								<tbody>
									@foreach ($user_words as $key => $word)
										<tr>
											<td>{{$key+1}}</td>
											<td>{{$word->word}}</td>
											<td>{{$word->transcription}}</td>
											<td>{{$word->translation}}</td>
											<td align="center" >{{$word->stage}}</td>
											<td>{{$word->date_of_repeat}}</td>
											<td>{{$word->created_at}}</td>
										</tr>
									@endforeach
								</tbody>
							</table>
						</div>
						
						<br>
						<a class="btn btn-default" href="{{ url('/personal_page') }}">
							<i class="fa fa-chevron-left" aria-hidden="true"></i> НАЗАД
						</a>
					@else
						<p>Ваш словарь пока пуст</p>
						<br><br>
						<a href="{{ url('/add_words') }}">
							ПОПОЛНИТЬ СЛОВАРЬ
						</a>
					@endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
