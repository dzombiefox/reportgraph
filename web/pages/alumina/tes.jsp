<script>
    function digitlooping(obj) {
	$(obj).priceFormat({
		prefix: '',
		centsSeparator: '',
		thousandsSeparator:',',
		centsLimit:0
		});
}
</script>
<input type="text" class='text validate[required]' value='0' name="harga_0" id="harga_0" size="10" onBlur='jumlah(this);' onkeyup="digitlooping(this);" onchange="digitlooping(this)"/>