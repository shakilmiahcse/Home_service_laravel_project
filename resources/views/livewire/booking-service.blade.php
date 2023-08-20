<div>
    <div class="section-title-01 honmob">
        <div class="bg_parallax image_01_parallax"></div>
        <div class="opacy_bg_02">
            <div class="container">
                <h1>Change Location</h1>
                <div class="crumbs">
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li>/</li>
                        <li>Service Booking</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="content-central">
        <div class="semiboxshadow text-center">
            <img src="img/img-theme/shp.png" class="img-responsive" alt="">
        </div>
        <div class="content_info">
            <div class="paddings-mini">
                <div class="container">
                    <div class="row">
                        @if(Session::has('message'))
                        <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="bookService">                            
                            <div class="col-md-8">
                                <h3>Search Your Location</h3>
                                <p class="lead">
                                </p>
                                <input type="text" class="form-control" id="autocomplete" name="location"
                                    placeholder="Search Location....">
                                <div id="map" style="height: 400px;"></div>
                            </div>
                            <div class="col-md-4">
                                <aside class="addlocation">
                                    <address>
                                        <div class="form-group">
                                            <label for="street_number">Street Number</label>
                                            <input wire:model="street_number" type="text" class="form-control">
                                            @error('street_number') <span class="text-danger">{{ $message }}</span> @enderror
                                        </div>
                                
                                        <div class="form-group">
                                            <label for="route">Route</label>
                                            <input wire:model="route" type="text" class="form-control">
                                            @error('route') <span class="text-danger">{{ $message }}</span> @enderror
                                        </div>
                                
                                        <div class="form-group">
                                            <label for="city">City</label>
                                            <input wire:model="city" type="text" class="form-control">
                                            @error('city') <span class="text-danger">{{ $message }}</span> @enderror
                                        </div>
                                
                                        <div class="form-group">
                                            <label for="state">State</label>
                                            <input wire:model="state" type="text" class="form-control">
                                            @error('state') <span class="text-danger">{{ $message }}</span> @enderror
                                        </div>
                                
                                        <div class="form-group">
                                            <label for="country">Country</label>
                                            <input wire:model="country" type="text" class="form-control">
                                            @error('country') <span class="text-danger">{{ $message }}</span> @enderror
                                        </div>
                                
                                        <div class="form-group">
                                            <label for="zipcode">Zipcode</label>
                                            <input wire:model="zipcode" type="text" class="form-control">
                                            @error('zipcode') <span class="text-danger">{{ $message }}</span> @enderror
                                        </div>
                                        <!-- Add the new address-related fields here -->
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                             <input wire:model="address" type="text" class="form-control">
                                             @error('address') <span class="text-danger">{{ $message }}</span> @enderror
                                         </div>

                                        <div class="form-group">
                                            <label for="payment_type">Payment Type</label>
                                            <select wire:model="payment_type" class="form-control">
                                                <option value="cash">Cash</option>
                                                <option value="card">Card</option>
                                            </select>
                                            @error('payment_type') <span class="text-danger">{{ $message }}</span> @enderror
                                        </div>
                                
                                        <!-- ... Rest of the form ... -->
                                        <div class="content-btn">
                                            <button type="submit" class="btn btn-primary pull-right">Booking Confirm</button>
                                        </div>
                                    </address>
                                </aside>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="section-twitter content_resalt border-top">
            <i class="fa fa-twitter icon-big"></i>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
