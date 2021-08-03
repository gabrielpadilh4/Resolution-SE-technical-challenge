# Resolution SE-Technical-challenge - Gabriel Padilha Santos

## Description

This README file has the intention to describe how you can configure a new ally into our platform.

### Adding new ally

To add a new ally, you need to run the sql statement below on the database. This will add an ID and all the data needed to this ally:

``` sql
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
```

Obs: **This is an example, you will need to change the data above according to the ally being added**

### Querying all allies with finazas tag

When you need to query all allies that contains `finanzas` tag, run the sql below and the data will be retrieved:

``` sql
SELECT * FROM public.stores s WHERE data::json->>'tags' LIKE '%finanzas%'
```

Example of result of query:
![](select_tags.png)

### Adding a credential to ally

After you register an ally, you can add the credential to it using the following command:
```sh
curl -X POST -H "Content-type:application/json" --data-binary "{\"username\": \"aliado_addi\", \"password\": \"}sxh7_5}BdJ4K:Qf\"}" http://localhost:5000/allies/1234567890/credentials
```
If everything was okay, you will see the message below:
```sh
gabrielpadilha@ubuntu-note:~/Downloads$ curl -X POST -H "Content-type:application/json" --data-binary "{\"username\": \"aliado_addi\", \"password\": \"}sxh7_5}BdJ4K:Qf\"}" http://localhost:5000/allies/1234567890/credentials
{
  "AllyId": "1234567890", 
  "AllyName": "Aliado ADDI", 
  "message": "Credentials added"
}
gabrielpadilha@ubuntu-note:~/Downloads$ 

```

If want to add the credential using a more friendly tool, i recommend postman like below:
![](postman_http_request.png)

## NOTES
- SQL script to add a new ally - [INSERT_NEW_ALLY](insert.sql).
- SQL query to list all allies with the tag "finanzas" - [ALLY_TAG_FINANZAS](select_tags_like_finanzas.sql)
- HTTP Request that adds a given ally's credentials through our API 

