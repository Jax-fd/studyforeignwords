<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDateOfRepeatToUsersWords extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users_words', function (Blueprint $table){
			$table->date('date_of_repeat')->after('stage');
		});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users_words', function ($table) {
			$table->dropColumn('date_of_repeat');
		});
    }
}
