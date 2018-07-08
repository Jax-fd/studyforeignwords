<?php

use Illuminate\Database\Seeder;

class StagesOfRepeatSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('Stages_of_repeat')->insert(
					['user_id' => 0,
					 'stages' => "1,1,1,2,4,8,15,20,25,30"
					]);
    }
}
