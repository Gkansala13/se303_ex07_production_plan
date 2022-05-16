gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  describe "Province" do 

    before {@asia = Province.new(sample_province_data)} 

    it "Shortfall" do
      assert_equal(5, @asia.shortfall)
    end

    it "Profit" do 
      assert_equal(230, @asia.profit)
    end

    it "Change of Production" do
      @asia.producers[0].production = 20
      assert_equal(-6, @asia.shortfall)
      assert_equal(292, @asia.profit)
    end

    it 'Zero Demand' do
      @asia.demand = 0
      assert_equal(-25, @asia.shortfall)
      assert_equal(0, @asia.profit)
    end

    it 'Negative Demand' do 
      @asia.demand = -1
      assert_equal(@asia.profit, -10)
      assert_equal(@asia.shortfall, -26)
    end

  end


  describe 'No Producers' do

    before do
      data = {
        name: "No proudcers",
        producers: [],
        demand: 30,
        price: 20 }
      @noProducers = Province.new(data)
    end

    it 'Shortfall' do
      assert_equal(30, @noProducers.shortfall)
    end

    it "Profit" do 
      assert_equal(0, @noProducers.profit)
    end

  end
end