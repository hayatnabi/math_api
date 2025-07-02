require 'swagger_helper'

RSpec.describe 'Math API', type: :request do
  [
    { path: '/add',        desc: 'Add two numbers' },
    { path: '/subtract',   desc: 'Subtract two numbers' },
    { path: '/multiply',   desc: 'Multiply two numbers' },
    { path: '/divide',     desc: 'Divide two numbers' },
    { path: '/power',      desc: 'Raise a to the power of b' },
    { path: '/mod',        desc: 'Modulus of a and b' }
  ].each do |route|
    path route[:path] do
      get(route[:desc]) do
        tags 'Math'
        produces 'application/json'
        parameter name: :a, in: :query, type: :number, required: true
        parameter name: :b, in: :query, type: :number, required: true

        response(200, 'successful') do
          let(:a) { 10 }
          let(:b) { 2 }
          run_test!
        end
      end
    end
  end

  path '/sqrt' do
    get('square root of a number') do
      tags 'Math'
      produces 'application/json'
      parameter name: :n, in: :query, type: :number, required: true

      response(200, 'successful') do
        let(:n) { 25 }
        run_test!
      end
    end
  end

  path '/log10' do
    get('log base 10') do
      tags 'Math'
      produces 'application/json'
      parameter name: :n, in: :query, type: :number, required: true

      response(200, 'successful') do
        let(:n) { 100 }
        run_test!
      end
    end
  end

  path '/ln' do
    get('natural logarithm') do
      tags 'Math'
      produces 'application/json'
      parameter name: :n, in: :query, type: :number, required: true

      response(200, 'successful') do
        let(:n) { 2.71828 }
        run_test!
      end
    end
  end

  %w[sin cos tan].each do |func|
    path "/#{func}" do
      get("#{func} of angle in degrees") do
        tags 'Math'
        produces 'application/json'
        parameter name: :x, in: :query, type: :number, required: true

        response(200, 'successful') do
          let(:x) { 30 }
          run_test!
        end
      end
    end
  end
end
