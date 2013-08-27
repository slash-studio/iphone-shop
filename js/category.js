var editType = 'change';

$(document).ready(function() {
   $('#edit-box #in_add').change(function() {
      var $box = $('#edit-box'); 
      $box.find('form legend').text('Добавление');
      $box.find('select#category_id :last-child').prop("selected", "selected");
      $box.find('select#category_id option').prop('disabled', false);
      $box.find('select#category_id option[value="-1"]').prop('disabled', true);
      $box.find('button[value="delete"]').css('display', 'none');
      $box.find('button[value="change"]').prop('value', 'add').text('Добавить');
      $box.find('#in_change').prop('disabled', true);
      $box.find('input#category').val('');
   });

   $('#edit-box #in_change').change(function() {
      var $box = $('#edit-box');
      $box.find('form legend').text('Редактирование');
      $box.find('select#category_id option[value="-1"]').prop('disabled', false); 
      $('#edit-box').find('button[value="delete"]').css('display', 'inline-block');
      $box.find('button[value="add"]').prop('value', 'change').text('Редактировать');
   });

   $('#category_tree').bind("select_node.jstree", function(e, data) {
      $(this).jstree("toggle_node", data.rslt.obj);
      $(this).jstree("deselect_node", data.rslt.obj);
   })
   .jstree({
      "core"   : {
         "animation" : 180
      },
      "themes" : {
         "theme" : "default",
         "icons" : false
      },
      "plugins"  : ["themes", "html_data", "sort"]
   });
});

function toggleOption(newId, parentId) {
   $('#edit-box select#category_id option').prop('disabled', false);
   var $box = $('#edit-box select#category_id');
   $box.children('option[value="'+newId+'"]').prop('disabled', true);
   $box.children('option[value="'+parentId+'"]').prop("selected", "selected");
   $('#category_tree li#category_'+newId).find('li').each(function(idx, el) {
      var li_id = $(this).attr('id');
      var id = (li_id.substring(li_id.indexOf('_') + 1));
      $('#edit-box select#category_id option[value="'+id+'"]').prop('disabled', true);
   });
}

$(document).on('click', '#category_tree ul li', function(e) {
   toggleOption();
   var $editBox = $('#edit-box');
   $editBox.find('form legend').text('Редактирование');
   $editBox.find('#in_change').removeProp('disabled');
   $editBox.find('#in_add').removeProp('checked');
   $editBox.find('#in_change').prop('checked', 'checked');
   $editBox.find('#in_id').css('display', 'block');
   var li_id = $(this).attr('id');
   var id = (li_id.substring(li_id.indexOf('_') + 1));
   var p_id = $($(this).parents().get(1)).attr('id');
   p_id = (p_id.substring(p_id.indexOf('_') + 1));
   if (p_id == 'tree') {
      p_id = -1;
   }
   toggleOption(id, p_id);
   if (p_id != -1) {
      $editBox.find('select#category_id option[value="-1"]').prop('disabled', true); 
   }
   $('#edit-box input#category').val($("select#category_id option[value='"+id+"']").text());
   $('#edit-box input#id').val(id);
   $('#edit-box').find('button[value="add"]').text('Редактировать');
   $('#edit-box').find('button[value="add"]').prop('value', 'change');
   $('#edit-box').find('button[value="delete"]').css('display', 'inline-block');
   e.stopPropagation();
});

$(document).on('click', '#edit-box button', function(e) {
   editType = $(this).val();
});

$(document).on('submit', 'form.edit-form', function() {
   var treeOpen = [];
   $('#category_tree .jstree-open').each(function (i, v) {
      var li_id = $(this).attr('id');
      var id    = (li_id.substring(li_id.indexOf('_') + 1));
      treeOpen.push(id);
   });
   $this     = $(this);
   var pid   = $this.find('select#category_id option:selected').val();
   var aid   = $this.find('input[name="id"]').val();
   var aname = $('#edit-box input#category').val();
   $.post(
         "/admin/edit_category.php",
         {
            type        : editType,
            "id"        : aid,
            "parent_id" : pid,
            "name"      : aname
         },
         function(data) {
            if (data.result) {
               var jtree = $.jstree._reference('#category_tree');
               jtree.destroy();
               $('#category_tree').html(data.table);
               $('#category_tree')
                  .on('loaded.jstree', function() {
                     var length = treeOpen.length;
                     for (var i = 0; i < length; i++) {
                        jtree.open_node('#category_'+treeOpen[i]);
                     }
                     jtree.open_node('#category_'+pid, -1);
                  })
                  .jstree({
                     "core"   : {
                       "animation" : 180
                     },
                     "themes" : {
                       "theme" : "default",
                       "icons" : false
                     },
                     "plugins"  : ["themes", "html_data", "sort"]
                  });
                  switch (editType) {
                     case 'change':
                        $('#category_id option[value="' + aid + '"]').text(aname);
                        break;
                     case 'add':
                        var li_id = $('#category_tree li a:contains("'+aname+'")').parents('li').attr('id');
                        var id = (li_id.substring(li_id.indexOf('_') + 1));
                        $("#category_id").append($('<option value="'+id+'">'+aname+'</option>'));
                        break;
                     case 'delete':
                        $("#category_id option[value="+aid+"]").remove();
                        break;
                  }
               alert('Успешно!');
            } else {
               alert(data.message);
            }
         },"json"
       );
   return false;
});
