<?php

namespace App\Http\Livewire\Admin;

use App\Models\Contact;
use Livewire\Component;

class AdminContactComponenet extends Component
{
    public function render()
    {
        $contacts = Contact::paginate(15);
        return view('livewire.admin.admin-contact-componenet',['contacts'=>$contacts])->layout('layouts.base');
    }
}
