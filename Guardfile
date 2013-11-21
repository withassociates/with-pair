options = {
  all_on_start: false,
  all_after_pass: false,
  focus_on_failed: false
}

guard :rspec, options do
  # Run spec/controllers/my_controller_spec.rb when my_controller.rb changes
  watch(%r{^app/controllers/(.+)\.rb}) { |m| "spec/controllers/#{m[1]}_spec.rb" }

  # Run spec/helpers/* when app/helpers/* changes
  watch(%r{^app/helpers/(.+)\.rb}) { 'spec/helpers' }

  # Run spec/jobs/my_job_spec.rb when app/jobs/my_job.rb changes
  watch(%r{^app/jobs/(.+)\.rb}) { |m| "spec/jobs/#{m[1]}_spec.rb" }

  # Run spec/mailers/my_mailer_spec.rb when app/mailers/my_mailer.rb changes
  watch(%r{^app/mailers/(.+)\.rb}) { |m| "spec/mailers/#{m[1]}_spec.rb" }

  # Run spec/models/my_model_spec.rb when app/models/my_model.rb changes
  watch(%r{^app/models/(.+)\.rb}) { |m| "spec/models/#{m[1]}_spec.rb" }

  # Run a specific spec or feature when it changes
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/.+\.feature$})

  # Run spec/* when spec_helper.rb or support/*.rb changes
  watch(%r{^spec/spec_helper.rb}) { 'spec' }
  watch(%r{^spec/support/.+\.rb}) { 'spec' }

  # Run spec/features/* when steps.rb changes
  watch(%r{^spec/features/steps.rb}) { 'spec/features' }

  # Run spec/features/* whenever (app|config)/* changes
  watch(%r{(app|config)/.+}) { 'spec/features' }

  # Run spec/style_spec.rb when app/**/*.* changes
  watch(%r{^(app|config|public)/(.+)}) { 'spec/style_spec.rb' }
end
