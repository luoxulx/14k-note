<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLinksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('links', function (Blueprint $table) {
            $table->increments('id');
            $table->tinyInteger('status')->comment('状态;1:显示;0:不显示');
            $table->integer('rating')->comment('友情链接评级');
            $table->integer('list_order')->comment('排序');
            $table->string('description', 255)->comment('描述');
            $table->string('url')->comment('url')->unique();
            $table->string('name', 32)->comment('名称');
            $table->string('image', 255)->comment('图片路径');
            $table->string('target', 10)->comment('打开方式');

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
        Schema::dropIfExists('links');
    }
}
