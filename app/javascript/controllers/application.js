import { Application } from "@hotwired/stimulus"
import Rails from '@rails/ujs'

const application = Application.start()

// Stimulusの設定
application.debug = false
window.Stimulus = application

// rails-ujsの設定
Rails.start()

export { application }