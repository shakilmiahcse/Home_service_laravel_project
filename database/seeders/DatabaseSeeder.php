<?php

namespace Database\Seeders;

use App\Models\ServiceCategory;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     * @return void
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
        // $this->call([
        //     ServiceCategorySeeder::class
        // ]);   
        \App\Models\Service::factory(20)->create();  
    }
}
