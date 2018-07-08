@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">ПОПОЛНЕНИЕ СЛОВАРЯ</div>
				
                <div class="panel-body">
					
					<div class="cur_word">
						@if ($id!=-1)
							<p>{{$word}}</p>
					</div>
					
					<form class="form-horizontal" role="form" method="POST" action="{{ url('/add_words') }}">
						{{ csrf_field() }}
						
						<input type="hidden" class="form-control" name="id" value="{{ $id }}">
						
						<div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
							<label for="name" class="col-md-4 control-label">ВАШ ОТВЕТ:</label>

							<div class="col-md-4">
								<input id="name" type="text" class="form-control" name="answer" autocomplete="off" autofocus >
							</div>
												
							<div class="col-md-4 ">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-btn"></i> ОТВЕТИТЬ
								</button>
							</div>
						</div>
					</form>
						
					@else
						<p>	Доступных слов больше нет. 
							Все слова из словаря либо были сразу правильно отвечены, 
							либо были добавлены в ваш словарь.
						</p>
						
					@endif
					
					<div class="prev_word">
						@if (!empty($mes_prev))
							<p>{!! $mes_prev !!}</p>
						@endif
					</div>
					
                </div>
				
				<!--Инфо-->
				<div class="panel-body pan_border">
					<p>Общее количество слов: {{ $all_words }}<p>
					<p>Количество доступных слов: {{ $all_words2 }}<p>
					<p>Правильно отвеченные: {{ $learned_words }}<p>
					<p>Добавлено на изучение: {{ $added_words }}<p>
				</div>
				<div class="panel-body pan_border">
					<a class="btn btn-default" href="{{ url('/personal_page') }}">
						<i class="fa fa-chevron-left" aria-hidden="true"></i> ЗАКОНЧИТЬ ПОПОЛНЕНИЕ
					</a>
				</div>
            </div>
        </div>
    </div>
</div>
@endsection
