require 'spec_helper'

describe ExceptionCop do
  after(:each) do
    ExceptionCop.reset
  end

  it 'returns default empty white_list' do
    expect(ExceptionCop.white_list).to be_empty
  end

  it 'returns white_list with values' do
    ExceptionCop.configure{|config| config.white_list += [RuntimeError, StandardError]}
    expect(ExceptionCop.white_list).to eq [RuntimeError, StandardError]
  end

  it 'doesn\t raise the error in the white list' do
    expect{raise}.to raise_error(RuntimeError)
    ExceptionCop.configure{|config| config.white_list << RuntimeError}
    expect(raise).to be_nil
  end

  it 'only raises the error in the while list' do
    ExceptionCop.configure{|config| config.white_list << RuntimeError}
    expect(raise).to be_nil
    expect{raise(StandardError)}.to raise_error(StandardError)
  end

end
