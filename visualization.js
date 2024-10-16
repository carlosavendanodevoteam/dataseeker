looker.plugins.visualizations.add({
  options: {
    text: {},
    text_color: {
      type: "string",
      label: "Text Color",
      default: "#000000"
    },
    url_to_embed: {
      type: "string",
      label: "URL to embed",
      default: "https://looker-viewer-dot-analysis-seeker.appspot.com/admin/calendar/hotel-puentereal/2024-06-01/2025-12-31"
    },
    font_family: {
      type: "string",
      label: "Font Family",
      default: "'Roboto', sans-serif"
    }
  },

  create: function(element, config) {
    element.innerHTML = `<div
      id='custom-vis-container' style='width:100%; height:100%; overflow:auto; font-family: ${config.font_family};'>
      <iframe id='embed-frame' allow='fullscreen' sandbox='allow-scripts allow-forms' src='${config.url_to_embed}' style='width:100%; height:100%; border:none;'></iframe>
      </div>`;
  },

  update: function(data, element, config, queryResponse) {
    document.getElementById("embed-frame").src = config.url_to_embed;
    document.getElementById("embed-frame").style.color = config.text_color;
    document.getElementById("custom-vis-container").style.fontFamily = config.font_family;
  }
});
