@extends('layout')
@section('title') Rent Himalaya @endsection
@section('keywords') Home,About,Contact,Car @endsection
@section('description') Write some descripton about the webpage @endsection
@section('content')

<div align="left" class="px-5 py-2" style="background:#1CD5E8;margin-top:5px; ">

  <p class="my-2 " style="font-weight:bold; "><a href="{{url('/')}}" class="black-text">Home </a>/ {{$Product->name}} </p>


</div>
<link rel="stylesheet" href="{{asset('assets/css/xzoom.css')}}">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script src="{{ asset('assets/js/srcforimagezoomingeffects.min.js')}}"></script>
<script src="{{ asset('assets/js/xzoom.min.js')}}"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>





<script>
  $(document).ready(function() {
    $("#main_image, .xzoom-gallery").xzoom({
      fadeIn: true,
      fadeOut: true
    });
    $('#daterange').daterangepicker({
      opens: 'left' // Adjust the calendar to open on the left of the input
    });
  });
</script>

<style>
  .checked {
    color: orange;
  }
</style>


<div class="container py-5">

  {{-- Row 1: Image & Details side by side --}}
  <div class="row product_data">
    <div class="col-md-6">
      {{-- Image Section --}}
      
      <img class="xzoom img-fluid rounded mb-3" id="main_image"  src="{{asset('Uploads/Products/'.$Product->image1)}}" xoriginal="{{asset('Uploads/Products/'.$Product->image1)}}">

      {{-- Optional thumbnails if you want below main image --}}
      <div class="d-flex gap-2">
        @foreach (['image1', 'image2', 'image3', 'image4'] as $img)
        @if (!empty($Product->$img))
               <a href="{{asset('Uploads/Products/'.$Product->$img)}}">
                              <img class="xzoom-gallery" style="width: 60px; height: 60px; object-fit: cover;" xpreview="{{asset('Uploads/Products/'.$Product->$img)}}" src="{{asset('Uploads/Products/'.$Product->$img)}}">
                          </a>
        @endif
        @endforeach
      </div>
    </div>

    <div class="col-md-6">
      {{-- Product Details --}}
      <h3 class="fw-bold">{{ $Product->name }}</h3>

      <p>
        Posted by
        <span class="{{ $Product->owner->profile->verified == '1' ? 'text-success' : 'text-danger' }}">
          {{ $Product->owner->profile->verified == '1' ? 'Verified' : 'Unverified' }} user
        </span>
      </p>
      <p class="mb-3">{{ $Product->description }}</p>
                                <input type="hidden"   name="product_id"   min=0 value="{{$Product->id}}" required class="form-control product_id">

      <p><strong>Price:</strong> रु {{ $Product->price }} per day</p>
      <p><strong>Product Value:</strong> रु {{ $Product->cost }}</p>

      {{-- Booking Inputs --}}
      <form>
        <div class="row g-3">
          <div class="col-md-6" style="margin-bottom: 5px;">
            <label for="quantity" class="form-label"><strong>Quantity</strong></label>            
            <input type="number" class="form-control quantity" name="quantity" max="{{ $Product->quantity }}" min="0" value="{{ $Product->quantity==null || $Product->quantity==0?0:$Product->quantity}}" placeholder="Quantity">

          </div>
        </div>

        <div class="row g-3">
          <div class="col-md-6">
            <label for="start_date" class="form-label"><strong>Start Date</strong></label>
            <input type="date" class="form-control start_date" name="start_date" id="start_date" placeholder="Date for Rent">

          </div>

          <div class="col-md-6">
            <label for="end_date" class="form-label"><strong>End Date</strong></label>
            <input type="date" class="form-control end_date" name="end_date" id="end_date" placeholder="Date for Rent" disabled>

          </div>
        </div>

        <div class="col-12 my-3" id="changethebuttons" style="margin-left:-20px;">
          @if((!Auth()->user()) || $Product->quantity == null || $Product->quantity == 0 || (!empty(Auth()->user()) && ($Product->owner_id == Auth()->user()->id || Auth()->user()->email_verified == 0 || empty(Auth()->user()->profile) || Auth()->user()->profile->verified == 0)))
          <button class="btaobtn btaobtn-primary px-2 py-2 book-now-btn" disabled>Book</button>
          @else
          <button class="btn btn-primary book-now-btn">Book</button>
          @endif
        </div>
      </form>
      <div id="showloading"> </div>
      <div align="left" class="alert alert-danger" id="msg_diverr2" style="display: none;">
        <span id="triggererrors"></span>
      </div>
    </div>
  </div>

  <div class="row mt-5">
    <div class="col-12">
      <h4>Description</h4>
      <div>{!! $Product->additional_info !!}</div>
    </div>
  </div>

</div>
</div>



@endsection