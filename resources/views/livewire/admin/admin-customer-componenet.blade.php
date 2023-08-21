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
                <h1>Customers</h1>
                <div class="crumbs">
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li>/</li>
                        <li>Customers</li>
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
                                            All Customers
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
                                       <th>Name</th>
                                       <th>Email</th>
                                       <th>Phone</th>
                                     </tr>
                                </thead>
                               <tbody>
                               @foreach($users as $user)
                                      <tr>
                                        <td>{{ $user->id }}</td>
                                        <td>{{ $user->name }}</td>
                                        <td>{{ $user->email }}</td>
                                        <td>{{ $user->phone }}</td>
                                      </tr>
                               @endforeach
                              </tbody> 
                           </table>
                               {{-- {{$users->links()}} --}}
                           </div>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
