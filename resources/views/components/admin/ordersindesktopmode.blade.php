<div class="container"> 
    <h3 class="py-2 px-5">All Orders</h3>
   <div class="row px-5">
       
       <div class="col-md-12">
               <div class="card">
                   <div class="card-body table-responsive">
                       <table class="table table-striped table-bordered ">
                           <thead>
                               <th>Order_Id</th>
                               <th>Order Details</th>
                               <th>Delivery Address</th>
                               <th>Total Price</th>
   
                               <th>Action</th> 
                               
   
                           </thead>
                           @php
                           $email= Auth::user()->email;
                           $Orders=App\Models\Order::paginate(5);
                         @endphp
                           <tbody>
                               @foreach ($Orders as $item)
                           <tr>
   
                               <td>{{$item->id}}</td>
                               <td><?php echo $item->Order_Details?></td>
                               <td><?php echo $item->Delivery_Address ?></td>
                               <td>{{$item->Amount}}</td>
                               <td> 
                                
                                <a href="{{url('admin-Order-Status/'.$item->id.'')}}" class="badge btaobtn btaobtn-primary px-2 py-2">Check Status</a>
                                 
                                 @if($item->Delivery_Status!='pending' || $item->Order_Cancel_Status==1)
                                  <a href="{{url('admin-Order-Status/'.$item->id.'')}}"    class="badge btaobtn btaobtn-danger px-2 py-2 disabled">Cancel Order</a>
                                  @else
                                      <a href="{{url('admin-Order-Cancel/'.$item->id.'')}}" class="badge btaobtn btaobtn-danger px-2 py-2">Cancel Order</a>
                               
                                 @endif
    
                               </td>
    
   
   
   
    
                               </td>
                           </tr>
                               @endforeach
   
                           </tbody>
   
                       </table>
                   </div>
               </div>
       </div>
        <div class="col-md-12">
            <br>
            <p  align="center">
            {{ $Orders->links('pagination::bootstrap-4')}}</p>
        </div>
   </div>
  
   </div>
   <br> <br>