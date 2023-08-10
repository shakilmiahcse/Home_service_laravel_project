<?php

use App\Http\Livewire\Admin\AdminDashboardComponent;
use App\Http\Livewire\Admin\AdminServiceCategoryComponent;
use App\Http\Livewire\Admin\AdminAddServiceCategoryComponent;
use App\Http\Livewire\Customer\CustomerDashboardComponent;
use App\Http\Livewire\HomeComponent;
use App\Http\Livewire\ServiceCategoriesComponent;
use App\Http\Livewire\Sprovider\SproviderDashboardComponent;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/',HomeComponent::class)->name('home');
Route::get('/service-categories',ServiceCategoriesComponent::class)->name('home.service_categories');
//for customer
Route::middleware(['auth:sanctum','verified'])->group(function(){
    Route::get('/customer/dashboard',CustomerDashboardComponent::class)->name('customer.dashboard');
});

//for service provider
Route::middleware(['auth:sanctum','verified','authsprovider'])->group(function(){
    Route::get('/sprovider/dashboard',SproviderDashboardComponent::class)->name('sprovider.dashboard');
});

//for admin
Route::middleware(['auth:sanctum','verified','authadmin'])->group(function(){
    Route::get('/admin/dashboard',AdminDashboardComponent::class)->name('admin.dashboard');
    Route::get('/admin/service-categories',AdminServiceCategoryComponent::class)->name('admin.service_categories');
    Route::get('/admin/service-category/add',AdminAddServiceCategoryComponent::class)->name('admin.add_service_category');



});



 







