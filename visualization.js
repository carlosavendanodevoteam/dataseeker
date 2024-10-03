looker.plugins.visualizations.add({
    id: "custom_visualization",
    label: "Custom Visualization",
    options: {
      text_color: {
        type: "string",
        label: "Text Color",
        default: "#000000"
      },
      url_to_embed: {
        type: "string",
        label: "URL to embed",
        default: "http://127.0.0.1:9080/admin/calendar/"
      }
    },

    create: function(element, config) {
      element.innerHTML = "
        <div id="custom-vis-container" style="width:100%; height:100%; overflow:auto;">
          <iframe id="embed-frame" src="${config.url_to_embed}" style="width:100%; height:100%; border:none;"></iframe>
        </div>";
      element.style.color = config.text_color;
    },

    update: function(data, element, config, queryResponse) {
      document.getElementById("embed-frame").src = config.url_to_embed;
      element.style.color = config.text_color;
    }
});
