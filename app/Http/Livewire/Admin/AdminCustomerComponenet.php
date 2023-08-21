<?php

namespace App\Http\Livewire\Admin;

use App\Models\User;
use Livewire\Component;

class AdminCustomerComponenet extends Component
{
    public $users;

    public function mount()
    {
        // Fetch users where utype is "CST"
        $this->users = User::where('utype', 'CST')->get();
    }

    public function render()
    {
        return view('livewire.admin.admin-customer-componenet')->layout('layouts.base');
    }
}
