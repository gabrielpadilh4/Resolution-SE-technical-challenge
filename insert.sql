INSERT INTO
	public.stores(id,data)
VALUES ('1234567890', 
    jsonb_build_object(
        'name', 'Aliado ADDI', 
        'brand', 'Merchant',
        'minAmount', 20,
        'maxAmount', 150,
        'discount', 5,
        'tags', json_build_array('tecnologia', 'informacion', 'finanzas'),
        'credentials', null
    )
)