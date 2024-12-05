{
  "$GMObject":"",
  "%Name":"obj_sensor",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_sensor",
  "overriddenProperties":[],
  "parent":{
    "name":"Variados",
    "path":"folders/Objetos/Variados.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"destino","filters":[
        "GMRoom",
      ],"listItems":[],"multiselect":false,"name":"destino","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":{"name":"rm_principal","path":"rooms/rm_principal/rm_principal.yy",},"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"rm_principal","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"posicao_x","filters":[],"listItems":[],"multiselect":false,"name":"posicao_x","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
    {"$GMObjectProperty":"v1","%Name":"posicao_y","filters":[],"listItems":[],"multiselect":false,"name":"posicao_y","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":1,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_sensor",
    "path":"sprites/spr_sensor/spr_sensor.yy",
  },
  "spriteMaskId":null,
  "visible":false,
}