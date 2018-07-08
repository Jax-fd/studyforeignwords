<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Word extends Model
{
    protected $fillable = [
        'word', 'transcription', 'translation',
    ];
	
	public function users()
	{
		return $this->belongsToMany('App\User','users_words');
	}
}
