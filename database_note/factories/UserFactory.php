<?php

use Faker\Generator as Faker;
/*
|--------------------------------------------------------------------------
| Models Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(App\Models\Users::class, function (Faker $faker) {
    static $password;
    return [
        'user_type' => 1,
        'login_name' => $faker->firstName . $faker->lastName,
        'nickname' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => $password ?: $password = bcrypt('secret'), // secret
        'sex' => rand(1,2),
        'user_status' => 1,
        'avatar' => '',
        'signature' => str_random(50),
        'mobile' => $faker->phoneNumber,
        'birthday' => $faker->date(),
        'remember_token' => str_random(10),
    ];
});
