@extends('layouts.app')

@section('view_descrip')
<h3 class="text-center">Departamentos
	@if(Auth::user()->restringido())
			<a href="{{route('com_departamentos.create')}}" class="pull-right btn-flat btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i>
	 		Agregar Departamentos</a>
	@endif
</h3>
@endsection

@section('content')
		<?php
			$x = 0;
		?>
		@if(Session::has('flash_create'))
			<div class="row">
				<div class="col-md-8 col-md-offset-2 ">
					<div class="alert alert-success">
					 <h5 class="text-center">{{Session::get('flash_create')}}&nbsp;<i class="fa fa-exclamation-circle"></i></h5>
				    </div>
				</div>
			</div>
			 <?php 
			 	$x = 1;
			 ?>
		@endif
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center">
				<div class="alert alert-success" id="aviso" style="display: none;">
				 <h5 class="">Departamento eliminado con éxito&nbsp;<i class="fa fa-exclamation-circle"></i></h5>
			    </div>
			</div>
		</div>
	<table class="table table-bordered table-hover table-condensed tabla">
		<thead>
			<tr>
				<th class="text-center">#</th>
				<th class="text-center">Programatica</th>
				<th class="text-center">Unidad</th>
				<th class="text-center">Descripción</th>
				@if(Auth::user()->restringido())
				<th class="text-center">Accion</th>
				@endif
			</tr>
		</thead>
		<tbody class="text-center">
			@php $i=1; @endphp
			@foreach($departamentos as $con)
				<tr>
					<td>{{$i}}</td>
					<td>{{$con->programatica}}</td>
					<td>{{$con->unidad_departamento}}</td>
					<td>{{$con->descripcion}}</td>
					@if(Auth::user()->restringido())
					<td>
						<a href="{{ url('com_departamentos/'.$con->id.'/edit') }}" class="btn btn-flat btn-primary btn-sm" title="Editar"><i class="fa fa-edit"></i></a>
						<button type="button" class="btn btn-danger btn-sm eliminar" title="Eliminar" data-eliminar = "{{$con->id}}"><i class="fa fa-trash"></i></button>
					</td>
					@endif
				</tr>
				@php $i++; @endphp
			@endforeach
		</tbody>
	</table>
	<form action="{{url('com_departamentos/'.':USER')}}" id="form_eliminar">
		{{csrf_field()}}
		{{method_field('DELETE')}}
	</form>
@endsection
@section('script')
	<script>
		$(function(){
			var validate = <?php echo $x; ?>;

			if(validate == 1)
			{
				setTimeout(function(){
					
					$(".alert-success").hide('slow');

				}, 2500);
				
			}

			$(".eliminar").click(function(){

				var btn  = $(this),
					id   = btn.data('eliminar'),
					form = $("#form_eliminar"),
					ruta = form.attr('action').replace(':USER', id),
				   datos = form.serialize(),
				   agree = confirm("Esta seguro de querer borrar este registro?")

				   if(agree)
				   {
					$.post(ruta, datos, function(){
				   		btn.parent().parent().remove();
						$("#aviso").show('slow/400/fast', function(){
							setTimeout(function(){
								$("#aviso").hide('slow');
							}, 2000);
						});
					});
				   }
			});
		})
	</script>
@endsection