<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('post_categories', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('parent_id')->comment('父级id');
            $table->integer('post_count')->comment('文章数');
            $table->integer('status')->comment('文章状态');
            $table->string('name')->comment('分类名');
            $table->string('description')->comment('分类描述');
            $table->string('path')->comment('分类目录路劲example：xx-xx-xx');
            $table->string('thumbnail')->comment('分类缩略图');

            $table->string('seo_title');
            $table->string('seo_keywords');
            $table->mediumText('seo_description');

            $table->json('more')->comment('扩展属性');

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
        Schema::dropIfExists('post_categories');
    }
}
