<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->increments('id');
            //$table->integer('category_id')->comment('分类ID');
            $table->integer('user_id')->comment('用户id');
            $table->integer('status')->comment('状态，1：可用，0：禁用')->default(1);
            $table->string('slug')->unique();
            $table->string('title')->comment('标题');
            $table->string('subtitle')->comment('副标题');
            $table->mediumText('description')->comment('简述');
            $table->longText('content')->comment('内容');
            $table->string('thumbnail')->comment('缩略图');
            $table->string('orig')->comment('文章来源，example：转自：xxx')->nullable();
            $table->enum('is_original', ['true','false'])->comment('是否原创')->default('true');
            $table->enum('is_draft', ['true','false'])->comment('是否草稿');
            $table->enum('is_top', ['true','false'])->comment('是否置顶');
            $table->integer('view_count');
            $table->integer('like_count');
            $table->json('more')->comment('扩展');


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
        Schema::dropIfExists('posts');
    }
}
