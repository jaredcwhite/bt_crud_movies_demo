import "index.css"
import "syntax-highlighting.css"
import * as Turbo from "@hotwired/turbo"

const redirectTo = function() {
  const payload = JSON.parse(this.templateContent.textContent)
  setTimeout(() => {
    Turbo.visit(payload.url)
  }, payload.delay || 0)
}

const toast = function() {
  const toastContent = this.templateContent
  document.documentElement.addEventListener('turbo:load', () => {
    document.body.append(toastContent)
    document.body.querySelector("sl-alert").toast()
  }, { once: true }) 
}

Turbo.StreamActions.redirect_to = redirectTo
Turbo.StreamActions.toast = toast

import "@shoelace-style/shoelace/dist/components/alert/alert.js"
import "@shoelace-style/shoelace/dist/components/button/button.js"

// Use the public icons folder:
import { setBasePath } from "@shoelace-style/shoelace/dist/utilities/base-path.js"
setBasePath("/shoelace-assets")

// Uncomment the line below to add transition animations when Turbo navigates.
// We recommend adding <meta name="turbo-cache-control" content="no-preview" />
// to your HTML head if you turn on transitions. Use data-turbo-transition="false"
// on your <main> element for pages where you don't want any transition animation.
//
import "./turbo_transitions.js"

// Import all JavaScript & CSS files from src/_components
import components from "bridgetownComponents/**/*.{js,jsx,js.rb,css}"
