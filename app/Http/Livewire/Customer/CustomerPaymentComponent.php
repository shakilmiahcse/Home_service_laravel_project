<?php

namespace App\Http\Livewire\Customer;

use Livewire\Component;

class CustomerPaymentComponent extends Component
{
    public function render()
    {
        return view('livewire.customer.customer-payment-component')->layout('layouts.base');
    }
}
