vim.cmd([[
let g:rails_projections = {
  \ "app/controllers/*_controller.rb": {
  \   "test": [
  \     "spec/controllers/{}_controller_spec.rb",
  \     "spec/requests/{}_spec.rb"
  \   ],
  \ },
  \ "spec/requests/*_spec.rb": {
  \   "alternate": [
  \     "app/controllers/{}_controller.rb",
  \   ],
  \ }}
]])
