<?php

namespace App\Http\Livewire\Admin;

use App\Models\ServiceCategory;
use Livewire\Component;
use Livewire\WithPagination;

class AdminServiceCategoryComponent extends Component
{
    use WithPagination;

    public function deleteServicecategory($id)
    {
        $scategory = ServiceCategory::find($id);
        if($scategory->image)
        {
            unlink('images/categories'.'/'.$scategory->image);
        }
        $scategory->delete();
        session()->flash('massage','Service Category has been deleted succesfully');
    }
    public function render()
    {   
        $scategories = ServiceCategory::paginate(10);
        return view('livewire.admin.admin-service-category-component', ['scategories' => $scategories] )
        ->layout('layouts.base');
    }
}
