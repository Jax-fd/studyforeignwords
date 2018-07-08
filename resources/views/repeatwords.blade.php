@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">ПОВТОРЕНИЕ СЛОВ</div>

                <div class="panel-body">
					
					@if ($id!=-1)
					
						<div class="cur_word">
							<p>{{$word}}</p>
						</div>
						
						<form class="form-horizontal" role="form" method="POST" action="{{ url('/repeat_words') }}">
							{{ csrf_field() }}
							
							<input type="hidden" class="form-control" name="id" value="{{ $id }}">
							
							<div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
								<label for="name" class="col-md-4 control-label">ВАЩ ОТВЕТ:</label>

								<div class="col-md-4">
									<input id="name" type="text" class="form-control" name="answer" autocomplete="off" autofocus >
								</div>
							
								<div class="col-md-4">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-btn fa-user"></i> ОТВЕТИТЬ
									</button>
								</div>
							</div>
						</form>
						
						
					@else
						<p>	На сегодня слов для повторения нет.
						</p>
					@endif
					
					<div class="prev_word">
						@if (!empty($mes_prev))
							<p>{!! $mes_prev !!}</p>
							<br>
						@endif
					</div>
				</div>
				
				<div class="panel-body pan_border">
					<p>Осталось повторить: {{ $number_of_words }}<p>
				</div>
				<div class="panel-body pan_border">
					<a class="btn btn-default" href="{{ url('/personal_page') }}">
						<i class="fa fa-chevron-left" aria-hidden="true"></i> ЗАКОНЧИТЬ ПОВТОРЕНИЕ
					</a>
				</div>
            </div>
        </div>
    </div>
</div>
@endsection
