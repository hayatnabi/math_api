class Api::V1::MathController < ApplicationController
  def add
    a, b = params[:a].to_f, params[:b].to_f
    render json: { result: a + b }
  end

  def subtract
    a, b = params[:a].to_f, params[:b].to_f
    render json: { result: a - b }
  end

  def multiply
    a, b = params[:a].to_f, params[:b].to_f
    render json: { result: a * b }
  end

  def divide
    a, b = params[:a].to_f, params[:b].to_f
    if b == 0
      render json: { error: "Division by zero is not allowed" }, status: :unprocessable_entity
    else
      render json: { result: a / b }
    end
  end

  def sqrt
    n = params[:n].to_f
  
    if n < 0
      render json: { error: "Cannot calculate square root of a negative number" }, status: :unprocessable_entity
    else
      render json: { result: Math.sqrt(n) }
    end
  end

  def power
    a, b = params[:a].to_f, params[:b].to_f
    render json: { result: a**b }
  end
  
  def mod
    a, b = params[:a].to_f, params[:b].to_f
    if b == 0
      render json: { error: "Modulo by zero is not allowed" }, status: :unprocessable_entity
    else
      render json: { result: a % b }
    end
  end
  
  def log10
    n = params[:n].to_f
    if n <= 0
      render json: { error: "Logarithm is undefined for zero or negative numbers" }, status: :unprocessable_entity
    else
      render json: { result: Math.log10(n) }
    end
  end
  
  def ln
    n = params[:n].to_f
    if n <= 0
      render json: { error: "Natural log is undefined for zero or negative numbers" }, status: :unprocessable_entity
    else
      render json: { result: Math.log(n) }
    end
  end
  
  def sin
    x = params[:x].to_f
    render json: { result: Math.sin(x * Math::PI / 180) }  # degrees to radians
  end
  
  def cos
    x = params[:x].to_f
    render json: { result: Math.cos(x * Math::PI / 180) }
  end
  
  def tan
    x = params[:x].to_f
    if (x % 180).zero?
      render json: { result: 0.0 }
    elsif (x % 90).zero? && (x % 180).nonzero?
      render json: { error: "Tangent is undefined at #{x}°" }, status: :unprocessable_entity
    else
      render json: { result: Math.tan(x * Math::PI / 180) }
    end
  end
  
  def help
    base_url = request.base_url + "/api/v1"
  
    render json: JSON.pretty_generate({
    endpoints: {
        add:      "#{base_url}/add?a=5&b=3",
        subtract: "#{base_url}/subtract?a=10&b=4",
        multiply: "#{base_url}/multiply?a=2&b=6",
        divide:   "#{base_url}/divide?a=10&b=2",
        sqrt:     "#{base_url}/sqrt?n=25",
        power:    "#{base_url}/power?a=2&b=3",
        mod:      "#{base_url}/mod?a=10&b=3",
        log10:    "#{base_url}/log10?n=100",
        ln:       "#{base_url}/ln?n=2.71828",
        sin:      "#{base_url}/sin?x=30",
        cos:      "#{base_url}/cos?x=60",
        tan:      "#{base_url}/tan?x=45"
      },
      note: "All parameters should be passed as query params. Trigonometric inputs are in degrees."
    }), content_type: 'application/json'
  end  
end
