<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->tinyInteger('user_type')->comment('状态;1:管理员可登录后台;0:仅前台用户登录')->default(1);
            $table->string('login_name', 64)->comment('登录名');
            $table->string('nickname', 64)->comment('昵称');
            $table->string('email', 128)->unique();
            $table->string('password', 128);
            $table->tinyInteger('sex')->comment('1:男，2：女');
            $table->tinyInteger('user_status')->comment('用户状态，1：可用，0：禁用');
            $table->string('avatar',255)->comment('用户头像');
            $table->string('signature',255)->comment('签名');
            $table->string('mobile',50)->comment('用户电话号码');
            $table->integer('birthday');
            $table->rememberToken();

            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
