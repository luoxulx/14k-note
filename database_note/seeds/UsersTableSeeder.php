<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(App\Models\Users::class, 16)->create()->each(function ($u){
            //$u->posts()->save(factory(App\Posts::class)->make());
        });
    }
}
