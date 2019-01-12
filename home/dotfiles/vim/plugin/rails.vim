let g:rails_projections = {
      \ "app/repositories/*_repository.rb": {
      \   "command": "repository",
      \   "template": "module %SRepository\n  included do\n  end\nend",
      \   "related": "app/models/%s.rb",
      \   "affinity": "model"
      \ },
      \ "app/inputs/*_input.rb": {
      \   "command": "input",
      \   "template": "class %SInput < SimpleForm::Inputs::\nend",
      \   "affinity": "view"
      \ },
      \ "app/observers/*_observer.rb": {
      \    "command": "observer",
      \    "template": "class %SObserver\nend",
      \    "related": "app/moodels/%s.rb",
      \    "affinity": "model"
      \ },
      \ "app/workers/*_worker.rb": {
      \    "command": "worker",
      \    "template": "class %Sworker\nend",
      \    "related": "app/moodels/%s.rb",
      \    "affinity": "model"
      \ },
      \ "app/api/*s.rb": {
      \    "command": "api",
      \    "template": "class %Ss\nend",
      \    "related": "app/api/%s.rb",
      \    "affinity": "model"
      \ },
      \ "app/serializers/*_serializer.rb": {
      \    "command": "serializer",
      \    "template": "class %Sserializer\nend",
      \    "related": "app/moodels/%s.rb",
      \    "affinity": "model"
      \ },
\ }
      \ "features/support/*.rb": {"command": "support"},
      \ "features/support/env.rb": {"command": "support"}}
