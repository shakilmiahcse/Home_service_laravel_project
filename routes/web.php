<?php

use App\Http\Controllers\SearchController;
use App\Http\Livewire\Admin\AdminDashboardComponent;
use App\Http\Livewire\Admin\AdminServiceCategoryComponent;
use App\Http\Livewire\Admin\AdminAddServiceCategoryComponent;
use App\Http\Livewire\Admin\AdminAddServiceComponent;
use App\Http\Livewire\Admin\AdminAddSlideComponent;
use App\Http\Livewire\Admin\AdminBookingComponenet;
use App\Http\Livewire\Admin\AdminContactComponenet;
use App\Http\Livewire\Admin\AdminCustomerComponenet;
use App\Http\Livewire\Admin\AdminEditServiceCategoryComponent;
use App\Http\Livewire\Admin\AdminEditServiceComponent;
use App\Http\Livewire\Admin\AdminEditSlideComponent;
use App\Http\Livewire\Admin\AdminServiceProvidersComponent;
use App\Http\Livewire\Admin\AdminServicesComponent;
use App\Http\Livewire\Admin\AdminServicesByCategoryComponent;
use App\Http\Livewire\Admin\AdminSliderComponent;
use App\Http\Livewire\BookingService;
use App\Http\Livewire\ChangeLocationComponenet;
use App\Http\Livewire\ContactComponent;
use App\Http\Livewire\Customer\CustomerBookingComponenet;
use App\Http\Livewire\Customer\CustomerDashboardComponent;
use App\Http\Livewire\Customer\CustomerPaymentComponent;
use App\Http\Livewire\HomeComponent;
use App\Http\Livewire\ServiceCategoriesComponent;
use App\Http\Livewire\ServiceDetailsComponent;
use App\Http\Livewire\ServicesByCategoryComponent;
use App\Http\Livewire\Sprovider\EditSproviderProfileComponent;
use App\Http\Livewire\Sprovider\SproviderDashboardComponent;
use App\Http\Livewire\Sprovider\SproviderProfileComponent;
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
Route::get('/{category_slug}/services',ServicesByCategoryComponent::class)->name('home.services_by_category');
Route::get('/service/{service_slug}',ServiceDetailsComponent::class)->name('home.service_details');

Route::get('/autocomplete',[SearchController::class,'autocomplete'])->name('autocomplete');
Route::post('/search',[SearchController::class,'searchService'])->name('searchService');

Route::get('/change-location', ChangeLocationComponenet::class)->name('home.change_location');
Route::get('/contact-us',ContactComponent::class)->name('home.contact');

//for customer
Route::middleware(['auth:sanctum','verified'])->group(function(){
    Route::get('/customer/dashboard',CustomerDashboardComponent::class)->name('customer.dashboard');
    Route::get('/customer/booking',CustomerBookingComponenet::class)->name('customer.booking');

    // Booking Form
    Route::get('/service/details/booking', BookingService::class)->name('booking.form');
    Route::post('/service/booking', BookingService::class);
    Route::get('/customer/payment',CustomerPaymentComponent::class)->name('customer.payment');
});





//for service provider
Route::middleware(['auth:sanctum','verified','authsprovider'])->group(function(){
    Route::get('/sprovider/dashboard',SproviderDashboardComponent::class)->name('sprovider.dashboard');
    Route::get('/sprovider/profile',SproviderProfileComponent::class)->name('sprovider.profile');
    Route::get('/sprovider/profile/edit',EditSproviderProfileComponent::class)->name('sprovider.edit_profile');
});

//for admin
Route::middleware(['auth:sanctum','verified','authadmin'])->group(function(){
    Route::get('/admin/dashboard',AdminDashboardComponent::class)->name('admin.dashboard');
    Route::get('/admin/service-categories',AdminServiceCategoryComponent::class)->name('admin.service_categories');
    Route::get('/admin/service-category/add',AdminAddServiceCategoryComponent::class)->name('admin.add_service_category');
    Route::get('/admin/service-category/edit/{category_id}',AdminEditServiceCategoryComponent::class)->name('admin.edit_service_category');
    Route::get('/admin/all-services',AdminServicesComponent::class)->name('admin.all_services');
    Route::get('/admin{category_slug}/services',AdminServicesByCategoryComponent::class)->name('admin.services_by_category');
    Route::get('/admin/service/add',AdminAddServiceComponent::class)->name('admin.add_service');
    Route::get('/admin/service/edit/{service_slug}',AdminEditServiceComponent::class)->name('admin.edit_service');

    Route::get('/admin/slider',AdminSliderComponent::class)->name('admin.slider');
    Route::get('/admin/slide/add',AdminAddSlideComponent::class)->name('admin.add_slide');
    Route::get('/admin/slide/edit/{slide_id}',AdminEditSlideComponent::class)->name('admin.edit_slide');
    Route::get('/admin/contacts',AdminContactComponenet::class)->name('admin.contacts');

    Route::get('/admin/service-providers',AdminServiceProvidersComponent::class)->name('admin.service_providers');
    Route::get('/admin/booking-service',AdminBookingComponenet::class)->name('admin.booking_service');
    Route::get('/admin/customers',AdminCustomerComponenet::class)->name('admin.customers');
});



 







