module Vorax

	module Utils

		def transform_hash(original, options={}, &block)
			original.inject({}){|result, (key,value)|
				value = if (options[:deep] && Hash === value) 
									transform_hash(value, options, &block)
								else 
									value
								end
				block.call(result,key,value)
				result
			}
		end

	end

end
