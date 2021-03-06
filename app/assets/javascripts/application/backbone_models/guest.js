var Guest = Backbone.Model.extend({
  urlRoot: "/guests",
  fullName: function() {return this.get("first_name") + " " + this.get("last_name")}
});

var Guests = Backbone.Collection.extend({
  url: "/guests",
  model: Guest,
  tableSelector: function(table_id){
    return this.models.filter(function(model){
      return (table_id === model.get("table_id"));
    })
  },

  eventTableIds: function(){
    return this.models.map(function(model){ 
      return model.get("table_id");
    }).filter(function(v, i, s){ 
      return s.indexOf(v) === i;
    });
  }
});




