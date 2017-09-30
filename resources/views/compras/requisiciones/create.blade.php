@extends('layouts.app')

@section('content')

<h2 class="text-center"> Registrar Requisicion</h2>
<hr>

@if(count($errors) > 0)
			 <div class="alert alert-danger">
			 	<ul>
			 	@foreach($errors->all() as $error)
			 		<li>{{$error}}</li>
			 	@endforeach
			 	</ul>
			 </div>
			 @endif
<div class="content">
	<div class="row">
		<form action="{{route('com_requisicion.store')}}" method="POST">
		<input type="hidden" name="ano" value="{{$ano}}">
     {{csrf_field()}}
	<div class="col-md-6 col-md-offset-3">
		 <div class="form-group">
		 <label class="control-label">Codigo</label>
		 <input type="text" name="codigo" class="form-control" value ="00{{$codigo}}" readonly>
	    </div>
	</div>
    

     <div class="col-md-6">
     	<div class="form-group">
		  <label class="control-label">Fecha</label>
		  <input type="text"  name="fecha" class="form-control fecha" required>
	    </div>

		<div class="form-group">
		   <label class="control-label">Status</label>
		   <input type="text"  name="status" class="form-control" required readonly value="Vigente">
		</div>  
     </div>

<div class="col-md-6">
	<div class="form-group">
		<label class="control-label">Departamento</label>
		<select name="departamento_id" class="form-control" required>
			<option value="">Seleccione...</option>
		@foreach($departamentos as $depar)
			<option value="{{$depar->id}}">{{$depar->programatica}}</option>
		@endforeach
		</select>
	</div>
	<div class="form-group">
		 <label class="control-label">Descripcion</label>
		 <textarea class="form-control" type="text" name="descripcion" required></textarea>
	   </div>
</div>
<div class="col-md-1 col-md-offset-5">
	<div class="form-group">
	   <input type="submit" name="enviar" value="Registrar" class="btn btn-flat btn-success" {{ Auth::user()->restringido()?'':'disabled' }}>
	</div>
</div>
		
</form>
	</div>
</div>


@stop

@section('script')
	<script src="{{asset('js/bootstrap-datepicker.min.js')}}"></script>
	<script>
		$(function(){
			$(".fecha").datepicker({
				format: "dd-mm-yyyy",
				autoclose: true,
				language : 'es'
			})
			$("#unidad").change(function(){
				var val = $(this).val(),
					detalle = $(this).children('[value="'+val+'"]').data('descripcion')
				$("#des_unidad").val(detalle)
			})
		})
	</script>
@endsection