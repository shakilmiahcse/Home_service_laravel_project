<div>
    <style>
        nav svg{
            height: 20px;
        }
        nav .hidden{
            display: block !important;
        }
    </style>
    <div class="section-title-01 honmob">
        <div class="bg_parallax image_02_parallax"></div>
        <div class="opacy_bg_02">
            <div class="container">
                <h1>Bookings</h1>
                <div class="crumbs">
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li>/</li>
                        <li>Bookings</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="content-central">
        <div class="content_info">
            <div class="paddings-mini">
                <div class="container">
                    <div class="row portfolioContainer">
                        <div class="col-md-12 profile1">
                            <div class="panel panel-default">
                                <div class="penel-heading">
                                    <div class="row">
                                        <div class="col-md-6">
                                            All Bookings
                                        </div>
                                        <div class="col-md-6">
                                            
                                        </div>
                                    </div>
                                </div>
                           <div class="panel-body">
                            @if(Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                            @endif
                            <table class="table table-striped">
                                <thead>
                                     <tr>
                                       <th>Sl No</th>
                                       <th>service_id</th>
                                       <th>address</th>
                                       <th>street_number</th>
                                       <th>route</th>
                                       <th>city</th>
                                       <th>state</th>
                                       <th>country</th>
                                       <th>zipcode</th>
                                       <th>payment_type</th>
                                       <th>created_at</th>
                                     </tr>
                                </thead>
                               <tbody>
                               @foreach($bookings as $booking)
                                      <tr>
                                        <td>{{ $booking->id}}</td>
                                        <td>{{ $booking->service_id}}</td>
                                        <td>{{ $booking->address}}</td>
                                        <th>{{ $booking->street_number}}</th>
                                        <th>{{ $booking->route}}</th>
                                        <th>{{ $booking->city}}</th>
                                        <th>{{ $booking->state}}</th>
                                        <th>{{ $booking->country}}</th>
                                        <th>{{ $booking->zipcode}}</th>
                                        <th>{{ $booking->payment_type}}</th>
                                        <th>{{ $booking->created_at}}</th>
                                      </tr>
                               @endforeach
                              </tbody> 
                           </table>
                           </div>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
