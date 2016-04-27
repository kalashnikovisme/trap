require 'trap/version'
require 'trap/helpers/bootstrap_helper'

ActionView::Base.send :include, BootstrapHelper
