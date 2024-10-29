<?php if(isset($_GET['view'])): 
require_once('../../config.php');
endif;?>
<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<?php 
if(!isset($_GET['id'])){
    $_settings->set_flashdata('error','Nu a fost furnizat niciun ID de comandă.');
    redirect('admin/?page=orders');
}
$order = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client FROM `orders` o inner join clients c on c.id = o.client_id where o.id = '{$_GET['id']}' ");
if($order->num_rows > 0){
    foreach($order->fetch_assoc() as $k => $v){
        $$k = $v;
    }
}else{
    $_settings->set_flashdata('error','ID-ul comenzii furnizat este necunoscut');
    redirect('admin/?page=orders');
}
?>
<div class="card card-outline card-primary">
    <div class="card-body">
        <div class="conitaner-fluid">
            <p><b>Nume Client: <?php echo $client ?></b></p>
            <p><b>Adresă de livrare: <?php echo $delivery_address ?></b></p>
            <table class="table-striped table table-bordered" id="list">
                <colgroup>
                    <col width="15%">
                    <col width="35%">
                    <col width="25%">
                    <col width="25%">
                </colgroup>
                <thead>
                    <tr>
                        <th>Cantitate</th>
                        <th>Produs</th>
                        <th>Preț</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                        $olist = $conn->query("SELECT o.*,p.name,b.name as bname, i.variant FROM order_list o inner join inventory i on o.inventory_id = i.id inner join products p on i.product_id = p.id inner join brands b on p.brand_id = b.id where o.order_id = '{$id}' ");
                        while($row = $olist->fetch_assoc()):
                        foreach($row as $k => $v){
                            $row[$k] = trim(stripslashes($v));
                        }
                    ?>
                    <tr>
                        <td><?php echo $row['quantity'] ?></td>
                        <td>
                            <p class="m-0"><?php echo $row['name'] . " - " . $row['variant'] ?></p>
                            <p class="m-0"><small>Brand: <?php echo $row['bname']?></small></p>
                           
                        </td>
                        <td class="text-right"><?php echo number_format($row['price']) ?></td>
                        <td class="text-right"><?php echo number_format($row['price'] * $row['quantity']) ?></td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan='3'  class="text-right">Total</th>
                        <th class="text-right"><?php echo number_format($amount) ?></th>
                    </tr>
                </tfoot>
            </table>
        </div>
        <div class="row">
            <div class="col-6">
                <p>Modalitate de plată: <?php echo strtoupper($payment_method) ?></p>
                <p>Starea plății: <?php echo $paid == 0 ? '<span class="badge badge-light text-dark border px-3 rounded-pill">Neplătit</span>' : '<span class="badge badge-success px-3 rounded-pill">Plătit</span>' ?>
                <?php if(!isset($_GET['view']) && $paid == 0 && $status!= 4): ?>
                    <button type="button" id="pay_order" class="btn btn-sm btn-flat btn-primary">Marcați ca plătit</button>
                <?php endif; ?>
                </p>

            </div>
            <div class="col-6 row row-cols-2">
                <div class="col-3">Starea comenzii:</div>
                <div class="col-9">
                <?php 
                    switch($status){
                        case '0':
                            echo '<span class="badge badge-light text-dark border px-3 rounded-pill">În așteptare</span>';
	                    break;
                        case '1':
                            echo '<span class="badge badge-primary px-3 rounded-pill">Împachetat</span>';
	                    break;
                        case '2':
                            echo '<span class="badge badge-warning px-3 rounded-pill">Pregătit pentru livrare</span>';
	                    break;
                        case '3':
                            echo '<span class="badge badge-success px-3 rounded-pill">Livrat</span>';
	                    break;
                        default:
                            echo '<span class="badge badge-danger px-3 rounded-pill">Anulat</span>';
	                    break;
                    }
                ?>
                </div>
                <?php if(!isset($_GET['view'])): ?>
                <div class="col-3"></div>
                <div class="col">
                    <button type="button" id="update_status" class="btn btn-sm btn-flat btn-primary">Actualizează starea</button>
                </div>
                <?php endif; ?>
                
            </div>
        </div>
    </div>
</div>
<?php if(isset($_GET['view'])): ?>
<div class="modal-footer">
    <?php if(isset($status) && $status == 0): ?>
    <button type="button" class="btn btn-danger btn-flat btn-sm" id="cancel_order">Anulați comanda</button>
    <?php endif; ?>
    <button type="button" class="btn btn-secondary btn-flat btn-sm" data-dismiss="modal">Închide</button>
</div>
<style>
    #uni_modal>.modal-dialog>.modal-content>.modal-footer{
        display:none;
    }
    #uni_modal .modal-body{
        padding:0;
    }
</style>
<?php endif; ?>
<script>
    $(function(){
        $('#list td,#list th').addClass('py-1 px-2 align-middle')
        $('#update_status').click(function(){
            uni_modal("Actualizează starea", "./orders/update_status.php?oid=<?php echo $id ?>&status=<?php echo $status ?>")
        })
        $('#cancel_order').click(function(){
            _conf("Sunteți sigur că anulați această comandă?","cancel_order",[])
        })
        $('#pay_order').click(function(){
			_conf("Sigur marcați această comandă ca plătită?","pay_order",["<?= isset($id) ? $id : "" ?>"])
		})
    })
    function cancel_order(){
        start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=update_order_status",
			method:"POST",
			data:{id: '<?= isset($id) ? $id : '' ?>',status:4},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("A apărut o eroare!.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("A apărut o eroare!.",'error');
					end_loader();
				}
			}
		})
    }
    function pay_order($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=pay_order",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("A apărut o eroare!.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("A apărut o eroare!.",'error');
					end_loader();
				}
			}
		})
	}
</script>