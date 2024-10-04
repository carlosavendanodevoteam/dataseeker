looker.plugins.visualizations.add({
    options: {
      text_color: {
        type: "string",
        label: "Text Color",
        default: "#000000"
      },
      url_to_embed: {
        type: "string",
        label: "URL to embed",
        default: "https://v2-dot-call-seeker.appspot.com"
      }
    },

    create: function(element, config) {
      element.innerHTML = `<div
      id='custom-vis-container' style='width:100%; height:100%; overflow:auto;'>
      <iframe id='embed-frame' allow='fullscreen' sandbox='allow-scripts allow-forms' src='${config.url_to_embed}' style='width:100%; height:100%; border:none;'></iframe>
      </div>`;
    },

    update: function(data, element, config, queryResponse) {
      document.getElementById("embed-frame").src = config.url_to_embed;
      document.getElementById("embed-frame").style.color = config.text_color;
    }
  });
