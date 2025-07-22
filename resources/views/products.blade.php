@extends('layout')
@section('title') Rent Himalaya @endsection
@section('keywords') Home,About,Contact,Car @endsection
@section('description') Write some descripton about the webpage @endsection
@section('content')
<style>

    .checked {
      color: orange;
    }
    </style> 
    
<div id="slide_show_in_desktop_mode">
  @include('components.desktopslideshow')
</div>
<div id="slide_show_in_mobile_mode">
  @include('components.mobileslideshow')
</div> 
<!-- About Starts Here -->
<script>
    $( document ).ready(function() {
  new WOW().init();
  $( ".wow" ).addClass( "fadeInLeft" );
});
</script>


<!-- About completed Here -->

@php
$Products=App\Models\Products::where('status','=','1')->where('featured',1)->take(8)->get();
@endphp
<!-- Products Starts Here -->
<section id="Products" align="center" class="px-5 wow animated fadeInUpBig fast" style=" font-family: 'Balsamiq Sans', cursive;">
  
    <h1 class="black-text" style="font-weight:bold;">PRODUCTS</h1> 
    <div align="center">
        <p  class="col-md-2" style=" border-bottom: 2px solid #003399;"></p>
    </div>
    @foreach($categories as $category)
    <h1 class="text-dark fw-bold text-center mt-5">{{ $category->name }}</h1>
    <div class="mx-auto mb-4" style="border-bottom: 2px solid #003399; width: 100px;"></div>

    @if(!empty($category->products) && count($category->products))
        <div class="row my-4 px-4 w-100">
            @foreach($category->products as $item)
                <div class="col-md-3 px-3 mb-5">
                    <a href="{{ url('Shop/' . $item->url) }}" class="text-decoration-none">
                        <div class="rounded-2 overflow-hidden" style="width: 100%; aspect-ratio: 4/3; background: #f8f9fa;">
                            <img src="{{ asset('Uploads/Products/' . $item->image1) }}"
                                 alt="{{ $item->name }}"
                                 class="img-fluid w-100 h-100"
                                 style="object-fit: cover;">
                        </div>
                    </a>
                    <div class="py-3 px-2 bg-white text-center shadow-sm rounded-3 mt-2">
                        <span class="d-block fw-bold" style="font-family: 'Balsamiq Sans', cursive;">
                            {{ $item->name }}
                        </span>
                        <p class="mb-2">Price: रु {{ $item->price }}</p>
                        <a href="{{ url('Shop/' . $item->url) }}" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            @endforeach
        </div>
    @else
        <p class="text-center text-muted mb-5">No products found in this category.</p>
    @endif
@endforeach


   
    <hr class="col-md-6"> 
</section>
<!-- Products Ends Here --> 


<!-- ======= Contact Section Starts Here ======= --> 
 


<!--Modal: modalSocial-->
<div class="modal fade" id="modalSocial" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">

    <!--Content-->
    <div class="modal-content">

      <!--Header-->
      <div class="modal-header  darken-3 white-text" style="background-color:#40BFD6;">
        <h4 class="title"><i class="fas fa-users"></i> Subscribe to Our Newsletter</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
      </div>

      <!--Body-->
      <div class="modal-body mb-0 text-center">
            <form method="POST" action="subscribe-news-letter">
                @csrf
                <input type="text" class="form-control"  name="name" placeholder="Your Name" required><br>
                <input type="email"  class="form-control"  name="email" placeholder="Your Email Id" required>
                <button class="btn" style="background-color:#40BFD6;">Submit</button>
            </form>
      </div>

    </div>
    <!--/.Content-->

  </div>
</div>
<!--Modal: modalSocial-->
  
  
   @if (session('status'))

        <script>
            $(document).ready(function () {

        $('#centralModalSuccess').modal('show');

        });
        </script>
@endif


@if($errors->any())

        <script>
            $(document).ready(function () {

        $('#centralModaldanger').modal('show');

        });
        </script>
@endif



 <!-- Central Modal Medium Success -->
 <div class="modal fade" id="centralModalSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-notify modal-success" role="document">
     <!--Content-->
     <div class="modal-content">
       <!--Header-->
       <div class="modal-header">
         <p class="heading lead"> Success</p>

         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true" class="white-text">&times;</span>
         </button>
       </div>

       <!--Body-->
       <div class="modal-body">
         <div class="text-center">
           <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
           <p>{{session('status')}} </p>
         </div>
       </div>

       <!--Footer-->
       <div class="modal-footer justify-content-center">
         
         <a type="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">Close</a>
       </div>
     </div>
     <!--/.Content-->
   </div>
 </div>
 <!-- Central Modal Medium Success-->
 
 <!-- Central Modal Medium Danger -->
 <div class="modal fade" id="centralModaldanger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-notify modal-danger" role="document">
     <!--Content-->
     <div class="modal-content">
       <!--Header-->
       <div class="modal-header">
         <p class="heading lead"> Form Not Submitted </p>

         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true" class="white-text">&times;</span>
         </button>
       </div>

       <!--Body-->
       <div class="modal-body">
         <div class="text-center">
             
           <i class="fas fa-exclamation fa-4x mb-3 animated rotateIn"></i>
           <p>@if($errors->any())
    {!! implode('', $errors->all('<div>:message</div>')) !!}
@endif </p>
         </div>
       </div>

       <!--Footer-->
       <div class="modal-footer justify-content-center">
         
         <a type="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">Close</a>
       </div>
     </div>
     <!--/.Content-->
   </div>
 </div>
 <!-- Central Modal Medium Danger-->
 
@endsection
  