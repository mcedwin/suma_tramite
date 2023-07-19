<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function select_options($datos,$id,$nombre,$vacio=FALSE){

	$options = ($vacio!=FALSE)?array(""=>$vacio):array();

	foreach ($datos as  $value) {

		// $options=$options."<option value='".$value->$id."'>".$value->$nombre."</option>";
		// $options = array_merge($options,array($value->$id)+1=>$value->$nombre));
		$options[$value->$id]=$value->$nombre;
	}

	return $options;
}
function select_enum($datos,$vacio=FALSE){

	$options = ($vacio!=FALSE)?array(""=>$vacio):array();
	if(!empty($datos)){
		foreach ($datos as  $value) {

			// $options=$options."<option value='".$value->$id."'>".$value->$nombre."</option>";
			// $options = array_merge($options,array($value->$id)+1=>$value->$nombre));
			$options[$value]=$value;
		}
	}else{
		$options[date('Y')] = date('Y');
	}
	return $options;
}

function column2fpdf($variable){
	$i=0;
	foreach ($variable as $key => $value) {
		
		$this->fpdf->SetFont('Arial','B',12);
		$this->fpdf->Cell(40,10,$key,1);
		$this->fpdf->SetFont('Arial','',12);
		$this->fpdf->Cell(50,10,$value,1);

		if($i==0)
		$this->fpdf->Cell(10,10,'',1);
		$i++;
	}
	// $this->fpdf->SetFont('Arial','B',12);
	// $this->fpdf->Cell(40,10,'Plazo:',1);
	// $this->fpdf->SetFont('Arial','',12);
	// $this->fpdf->Cell(50,10,'nose',1);
}
	
	
function mydropdown($col,$label,$id,$value,$class='',$add='',$selected=''){
	echo '<div class="col-md-'.$col.'">';
	echo '<div class="form-group">';
	echo form_label($label, $id);
	echo $add;
	if(!empty($add)) echo '<div class="input-group pull-lef3t" style="width:calc(100% '.(empty($add)?'':'- 50px').');">';
	echo form_dropdown($id,is_array($value)?$value:[''=>$value],array($selected),array('class' => 'form-control '.$class,'id'=>$id,'style'=>''));
	if(!empty($add)) echo '</div>';
	echo '</div>';
	echo "</div>";
}

function myinput($col,$label,$id,$value,$class='',$add=''){
	echo '<div class="col-md-'.$col.'">';
	echo '<div class="form-group">';
	echo form_label($label, $id);
	if(!empty($add)) echo '<div class="input-group">';
	echo form_input(array("name" => $id,'id'=>$id, "value" => $value, "class" => "form-control ".$class));
	echo $add;
	if(!empty($add)) echo '</div>';
	echo '</div>';
	echo "</div>";
}


function myhidden($id,$value,$class=''){
	echo form_hidden($id,$value);
}


function mybutton($col,$label,$id,$value,$class=''){
	echo '<div class="col-md-'.$col.'">';
	echo '<div class="form-group">';
	echo form_label($label, $id);
	echo form_button(array("name" => $id,'id'=>$id, "value" => $value, "class" => "btn btn-primary d-block ".$class,'style'=>'display:block'),$value);
	echo '</div>';
	echo "</div>";
}

function mytextarea($col,$label,$id,$value,$class='',$add=''){
	echo '<div class="col-md-'.$col.'">';
	echo '<div class="form-group">';
	echo form_label($label, $id);
	echo form_textarea(array("name" => $id,'id'=>$id, "value" => $value, "class" => "form-control ".$class,"rows" => 4));
	echo '</div>';
	echo "</div>";
}